# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="xpm is a command line tool to control capi5k"
HOMEPAGE="https://capi5k.github.io/capi5k"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/thor-0.19"
ruby_add_rdepend ">=dev-ruby/json-1.8"
ruby_add_rdepend ">=dev-ruby/bundler-1.6"

