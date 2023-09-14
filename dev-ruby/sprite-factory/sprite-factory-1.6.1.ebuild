# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Combines individual images from a directory into a single sprite image file and creates an appropriate CSS stylesheet"
HOMEPAGE="https://github.com/jakesgordon/sprite-factory"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rmagick-0"
ruby_add_rdepend ">=dev-ruby/chunky_png-0"

