# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit vdr-plugin-2

VERSION="2045" #every bump, new version

DESCRIPTION="VDR Plugin: Output Device for Raspberry Pi"
HOMEPAGE="https://projects.vdr-developer.org/projects/plg-rpihddevice"
SRC_URI="mirror://vdr-developerorg/${VERSION}/${P}.tgz"

KEYWORDS="~arm"
SLOT="0"
LICENSE="GPL-2"
IUSE=""

DEPEND=">=media-video/vdr-2
		>=media-libs/raspberrypi-userland-0_pre20140117
		virtual/ffmpeg"
RDEPEND="${DEPEND}"

src_prepare()
{
	sed -i "${S}"/Makefile -e '/LDFLAGS.*VCLIBDIR/s/$/ -Wl,--no-as-needed/' || die "sed failed"
	vdr-plugin-2_src_prepare
}
