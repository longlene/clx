# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Batch convert multiple files to htmls using the power of Vim editor"
HOMEPAGE="https://github.com/agilecreativity/vim_printer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/thor-0.19.1"
ruby_add_rdepend ">=dev-ruby/code_lister-0.2.2"
ruby_add_rdepend ">=dev-ruby/index_html-0.2.2"
ruby_add_rdepend ">=dev-ruby/agile_utils-0.2.2"
ruby_add_rdepend ">=dev-ruby/bundler-1.7.0"
ruby_add_rdepend ">=dev-ruby/rake-10.3.2"
ruby_add_rdepend ">=dev-ruby/awesome_print-1.2.0"
ruby_add_rdepend ">=dev-ruby/minitest-spec-context-0.0.3"
ruby_add_rdepend ">=dev-ruby/guard-minitest-2.3.1"
ruby_add_rdepend ">=dev-ruby/minitest-5.4.0"
ruby_add_rdepend ">=dev-ruby/guard-2.6.1"
ruby_add_rdepend ">=dev-ruby/pry-0.10.0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.24.1"
ruby_add_rdepend ">=dev-ruby/gem-ctags-1.0.6"
ruby_add_rdepend ">=dev-ruby/yard-0.8.7"

