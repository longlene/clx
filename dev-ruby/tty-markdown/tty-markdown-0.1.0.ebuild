# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Convert a markdown text or document into a terminal friendly output"
HOMEPAGE="https://piotrmurach.github.io/tty"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/kramdown-1.16.2"
ruby_add_rdepend ">=dev-ruby/pastel-0.7.2"
ruby_add_rdepend ">=dev-ruby/rouge-3.1.0"
ruby_add_rdepend ">=dev-ruby/strings-0.1.0"
ruby_add_rdepend ">=dev-ruby/tty-color-0.4.2"
ruby_add_rdepend ">=dev-ruby/tty-screen-0.6.2"
