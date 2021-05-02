# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A toolbox for developing beautiful command line clients"
HOMEPAGE="https://piotrmurach.github.io/tty/"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/tty-color-0.4.0"
ruby_add_rdepend ">=dev-ruby/tty-cursor-0.4.0"
ruby_add_rdepend ">=dev-ruby/tty-command-0.4.0"
ruby_add_rdepend ">=dev-ruby/tty-editor-0.2.0"
ruby_add_rdepend ">=dev-ruby/tty-file-0.3.0"
ruby_add_rdepend ">=dev-ruby/tty-pager-0.7.0"
ruby_add_rdepend ">=dev-ruby/tty-platform-0.1.0"
ruby_add_rdepend ">=dev-ruby/tty-progressbar-0.10.0"
ruby_add_rdepend ">=dev-ruby/tty-prompt-0.12.0"
ruby_add_rdepend ">=dev-ruby/tty-screen-0.5.0"
ruby_add_rdepend ">=dev-ruby/tty-spinner-0.4.0"
ruby_add_rdepend ">=dev-ruby/tty-table-0.8.0"
ruby_add_rdepend ">=dev-ruby/tty-which-0.3.0"
ruby_add_rdepend ">=dev-ruby/equatable-0.5.0"
ruby_add_rdepend ">=dev-ruby/pastel-0.7.0"
