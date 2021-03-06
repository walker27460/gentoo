# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs flag-o-matic

DESCRIPTION="DRY and RAD for regular expressions"
HOMEPAGE="https://github.com/jordansissel/grok https://code.google.com/p/semicomplete/wiki/Grok"
SRC_URI="https://github.com/jordansissel/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm ~arm64 hppa x86"

IUSE=""

CDEPEND="
	dev-db/tokyocabinet
	>=dev-libs/libevent-1.3:=
	>=dev-libs/libpcre-7.6
	>=net-libs/rpcsvc-proto-1
	net-libs/libtirpc
"

RDEPEND="${CDEPEND}"
DEPEND="${CDEPEND}
		>=dev-util/gperf-3.1"

PATCHES=(
	"${FILESDIR}"/grok-0.9.2-Makefile.patch
	"${FILESDIR}"/0.9.2-build-with-pcre-lt-8.34.patch
	"${FILESDIR}"/grok-0.9.2-build-with-gperf-3.1.patch
	"${FILESDIR}"/grok-0.9.2-libtirpc.patch
	"${FILESDIR}"/grok-0.9.2-libdir.patch
)

src_prepare() {
	default
	tc-export CC
}

src_install() {
	LIBDIR=$(get_libdir) default
}
