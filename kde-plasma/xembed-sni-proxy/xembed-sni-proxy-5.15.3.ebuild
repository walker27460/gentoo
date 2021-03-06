# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

KDE_AUTODEPS="false"
KMNAME="plasma-workspace"
inherit kde5

DESCRIPTION="Legacy xembed tray icons support for SNI-only system trays"
HOMEPAGE="https://cgit.kde.org/plasma-workspace.git/tree/xembed-sni-proxy/Readme.md"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

DEPEND="
	$(add_frameworks_dep extra-cmake-modules)
	$(add_frameworks_dep kwindowsystem)
	$(add_qt_dep qtcore)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtx11extras)
	x11-libs/libxcb
	x11-libs/libXtst
	x11-libs/xcb-util-image
"
RDEPEND="${DEPEND}
	!<kde-plasma/plasma-workspace-5.14.2:5
	!kde-plasma/xembed-sni-proxy:0
"

S="${S}/${PN}"

PATCHES=( "${FILESDIR}/${PN}-5.14.90-standalone.patch" )

src_prepare() {
	kde5_src_prepare

	sed -e "/set/s/GENTOO_PV/$(ver_cut 1-3)/" \
		-i CMakeLists.txt || die "Failed to prepare CMakeLists.txt"
}
