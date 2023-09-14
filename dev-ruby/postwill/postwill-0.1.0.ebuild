# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Posting to the most popular social media"
HOMEPAGE="https://github.com/postwill/postwill"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/dry-configurable-0.7"
ruby_add_rdepend ">=dev-ruby/dry-monads-0.3.1"
ruby_add_rdepend ">=dev-ruby/twitter-6.1.0"
ruby_add_rdepend ">=dev-ruby/koala-3.0.0"
ruby_add_rdepend ">=dev-ruby/pinterest-api-0.4.0"
ruby_add_rdepend ">=dev-ruby/instagram_upload-0.1.2"
ruby_add_rdepend ">=dev-ruby/bundler-1.15"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.6.0"
ruby_add_rdepend ">=dev-ruby/pry-byebug-3.5.0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.50.0"
ruby_add_rdepend ">=dev-ruby/vcr-3.0.3"
ruby_add_rdepend ">=dev-ruby/webmock-3.0.1"
ruby_add_rdepend ">=dev-ruby/ffaker-2.7"

