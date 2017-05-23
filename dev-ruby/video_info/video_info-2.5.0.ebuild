# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Get video info from Dailymotion, Vimeo, VK and YouTube url"
HOMEPAGE="https://rubygems.org/gems/video_info"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/addressable-0"
ruby_add_rdepend ">=dev-ruby/multi_json-1.11"
ruby_add_rdepend ">=dev-ruby/htmlentities-0"
ruby_add_rdepend ">=dev-ruby/iso8601-0"
ruby_add_rdepend ">=dev-ruby/oga-0"
ruby_add_rdepend ">=dev-ruby/open_uri_redirections-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.3.5"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/rspec-its-0"
ruby_add_rdepend ">=dev-ruby/vcr-0"
ruby_add_rdepend ">=dev-ruby/webmock-0"

