
#include <iostream>
#include <boost/bind.hpp>
#include <boost/asio.hpp>
#include <boost/shared_ptr.hpp>
#include <boost/enable_shared_from_this.hpp>
#include <boost/noncopyable.hpp>

class connection :
	public boost::enable_shared_from_this<connection>, private boost::noncopyable
{
public:

	explicit connection(boost::asio::io_service& io_service)
		: _socket(io_service)
	{ }

	boost::asio::ip::tcp::socket& socket()
	{
		return _socket;
	}

	void start()
	{
		_socket.async_read_some(boost::asio::buffer(_buffer),
			boost::bind(&connection::handle_read, shared_from_this(),
				boost::asio::placeholders::error,
				boost::asio::placeholders::bytes_transferred));
	}

private:

	void handle_read(const boost::system::error_code& error, std::size_t bytes_transferred)
	{
		if (!error) {
			boost::asio::async_write(_socket, boost::asio::buffer(_buffer, bytes_transferred),
				boost::bind(&connection::handle_write, shared_from_this(),
					boost::asio::placeholders::error));
		}
	}

	void handle_write(const boost::system::error_code& error)
	{
		if (!error) {
			_socket.async_read_some(boost::asio::buffer(_buffer),
				boost::bind(&connection::handle_read, shared_from_this(),
					boost::asio::placeholders::error,
					boost::asio::placeholders::bytes_transferred));
		}
	}

private:

	boost::asio::ip::tcp::socket _socket;

	boost::array<char, 8192> _buffer;
};

class server : private boost::noncopyable
{
public:

	explicit server(const std::string& address, const std::string& port)
		: _signals(_io_service), _acceptor(_io_service)
	{
		_signals.add(SIGINT);
		_signals.add(SIGTERM);
		_signals.add(SIGQUIT);
		_signals.async_wait(boost::bind(&server::handle_stop, this));

		boost::asio::ip::tcp::resolver resolver(_io_service);
		boost::asio::ip::tcp::resolver::query query(address, port);
		boost::asio::ip::tcp::endpoint endpoint = *resolver.resolve(query);
		_acceptor.open(endpoint.protocol());
		_acceptor.set_option(boost::asio::ip::tcp::acceptor::reuse_address(true));
		_acceptor.bind(endpoint);
		_acceptor.listen();

		std::cout << "Listening on " << address << ", port " << port << "...\n";
		std::cout << "Use <Ctrl-C> to stop.\n";

		start_accept();
	}

	void run()
	{
		_io_service.run();
	}

private:

	void start_accept()
	{
		_new_connection.reset(new connection(_io_service));
		_acceptor.async_accept(_new_connection->socket(),
			boost::bind(&server::handle_accept, this,
				boost::asio::placeholders::error));
	}

	void handle_accept(const boost::system::error_code& error)
	{
		if (!error) {
			_new_connection->start();
		}

		start_accept();
	}

	void handle_stop()
	{
		_io_service.stop();
	}

private:

	boost::asio::io_service _io_service;

	boost::asio::signal_set _signals;

	boost::asio::ip::tcp::acceptor _acceptor;

	boost::shared_ptr<connection> _new_connection;
};

int main(int argc, char *argv[])
{
	try
	{
		if (argc != 3) {
			std::cerr << "Usage: " << argv[0] << " <address> <port>\n\n";
			std::cerr << "  For IPv4, try:\n";
			std::cerr << "    " << argv[0] << " 0.0.0.0 2001\n";
			std::cerr << "  For IPv6, try:\n";
			std::cerr << "    " << argv[0] << " 0::0 2001\n\n";
			return 1;
		}

		server s(argv[1], argv[2]);
		s.run();
	}
	catch(const std::exception& e)
	{
		std::cerr << "exception: " << e.what() << "\n";
	}

	return 0;
}
