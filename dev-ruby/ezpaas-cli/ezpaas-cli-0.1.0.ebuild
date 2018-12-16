# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://github.com/TENDIGI/ezpaas-cli"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/thor-0.19.4"
ruby_add_rdepend ">=dev-ruby/tty-0.7.0"
ruby_add_rdepend ">=dev-ruby/httparty-0.15.6"
ruby_add_rdepend ">=dev-ruby/random-word-2.0.0"
ruby_add_rdepend ">=dev-ruby/git-1.3.0"
ruby_add_rdepend ">=dev-ruby/excon-0.58.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.15"
ruby_add_rdepend ">=dev-ruby/rake-10.0"

