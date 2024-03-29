# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A command line tool to turn images into ASCII art"
HOMEPAGE="https://github.com/nodanaonlyzuul/asciiart"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rmagick-2.13.4"
ruby_add_rdepend ">=dev-ruby/rainbow-2.0.0"
ruby_add_rdepend ">=dev-ruby/pry-0"

