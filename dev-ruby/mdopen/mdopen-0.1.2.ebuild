# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="mdopen is a command tool to preview a markdown file in a GitHub template"
HOMEPAGE="https://github.com/beijingrb/mdopen"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/os-1.0"
ruby_add_rdepend ">=dev-ruby/redcarpet-3.4"
ruby_add_rdepend ">=dev-ruby/bundler-1.16"
ruby_add_rdepend ">=dev-ruby/rake-10.0"

