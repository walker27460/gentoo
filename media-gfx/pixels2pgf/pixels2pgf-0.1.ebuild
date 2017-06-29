# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit autotools-utils

DESCRIPTION="Convert pixel images (e.g. QRCode) to PGF/Tikz rectangles"
HOMEPAGE="https://github.com/mgorny/pixels2pgf/"
SRC_URI="https://github.com/mgorny/pixels2pgf/releases/download/${P}/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-libs/libsdl
	media-libs/sdl-image"
DEPEND="${RDEPEND}"
