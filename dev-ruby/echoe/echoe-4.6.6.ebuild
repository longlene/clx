# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Rubygems packaging tool that provides Rake tasks for documentation, extension compiling, testing, and deployment"
HOMEPAGE="http://fauna.github.com/fauna/echoe/"

LICENSE="Academic Free License 3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rubyforge-2.0.4"
ruby_add_rdepend ">=dev-ruby/allison-2.0.3"
ruby_add_rdepend ">=dev-ruby/rdoc-2.5.11"
ruby_add_rdepend ">=dev-ruby/rake-0.9.2"

