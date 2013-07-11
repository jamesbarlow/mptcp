# Maintainer: Jon Gjengset <jon@tsp.io>
pkgname=mptcp-testtools
pkgver=VERSION
pkgrel=1
pkgdesc="Tools for testing mptcp performance"
arch=('any')
url="https://github.com/james-barlow/mptcp"
license=('MIT')
depends=('sudo' 'iproute2' 'perl' 'wireless_tools' 'gzip' 'bc' 'netperf' 'tcpdump' 'coreutils' 'openssh' 'iputils')
makedepends=('git')
source=("git://github.com/james-barlow/mptcp.git")
md5sums=('SKIP')

pkgver() {
  cd mptcp
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/mptcp"
  install -D -m755 scripts/* "${pkgdir}/usr/bin/"
}

# vim:set ts=2 sw=2 et:
