# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="      Ruby/SDL2 is an extension library to use SDL 2"
HOMEPAGE="https://github.com/ohai/ruby-sdl2"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""


