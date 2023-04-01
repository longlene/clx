# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Textbringer is a member of a demon race that takes on the form of an Emacs-like text editor"
HOMEPAGE="https://github.com/shugo/textbringer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/curses-1.2"
ruby_add_rdepend ">=dev-ruby/unicode-display_width-1.1"
ruby_add_rdepend ">=dev-ruby/clipboard-1.1"
ruby_add_rdepend ">=dev-ruby/fiddley-0.0.5"
ruby_add_rdepend ">=dev-ruby/editorconfig-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.14"
ruby_add_rdepend ">=dev-ruby/rake-12.0"
ruby_add_rdepend ">=dev-ruby/test-unit-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/codecov-0"
ruby_add_rdepend ">=dev-ruby/bundler-audit-0"
ruby_add_rdepend ">=dev-ruby/ripper-tags-0"

