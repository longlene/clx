# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A framework for creating e-books from Markdown using Ruby"
HOMEPAGE="http://rubygems.org/gems/kitabu"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-0"
ruby_add_rdepend ">=dev-ruby/nokogiri-0"
ruby_add_rdepend ">=dev-ruby/i18n-0"
ruby_add_rdepend ">=dev-ruby/thor-0"
ruby_add_rdepend ">=dev-ruby/redcarpet-0"
ruby_add_rdepend ">=dev-ruby/eeepub-with-cover-support-0"
ruby_add_rdepend ">=dev-ruby/rouge-0"
ruby_add_rdepend ">=dev-ruby/notifier-0"
ruby_add_rdepend ">=dev-ruby/rubyzip-0"
ruby_add_rdepend ">=dev-ruby/zip-zip-0"
ruby_add_rdepend ">=dev-ruby/sass-0"
ruby_add_rdepend ">=dev-ruby/sass-globbing-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/pry-meta-0"
ruby_add_rdepend ">=dev-ruby/codeclimate-test-reporter-0"

