# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby Gem to convert Word documents to markdown"
HOMEPAGE="https://github.com/benbalter/word-to-markdown"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/reverse_markdown-0.6"
ruby_add_rdepend ">=dev-ruby/descriptive_statistics-2.5"
ruby_add_rdepend ">=dev-ruby/premailer-1.8"
ruby_add_rdepend ">=dev-ruby/nokogiri-styles-0.1"
ruby_add_rdepend ">=dev-ruby/sys-proctable-0.9"
ruby_add_rdepend ">=dev-ruby/cliver-0.3"
ruby_add_rdepend ">=dev-ruby/rake-10.4"
ruby_add_rdepend ">=dev-ruby/shoulda-3.5"
ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/pry-0.10"
ruby_add_rdepend ">=dev-ruby/mocha-1.1"
ruby_add_rdepend ">=dev-ruby/minitest-5.0"

