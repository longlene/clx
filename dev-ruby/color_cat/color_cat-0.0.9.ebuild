# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Takes a url to an external image gives dominant color name and category"
HOMEPAGE=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rmagick-2.13"
ruby_add_rdepend ">=dev-ruby/bundler-1"
ruby_add_rdepend ">=dev-ruby/rake-10"
ruby_add_rdepend ">=dev-ruby/vcr-2.8"
ruby_add_rdepend ">=dev-ruby/minitest-4.7.5"
ruby_add_rdepend ">=dev-ruby/minitest-vcr-0.1"
ruby_add_rdepend ">=dev-ruby/mocha-0.14"
ruby_add_rdepend ">=dev-ruby/faraday-0.8"
ruby_add_rdepend ">=dev-ruby/webmock-1.16"
ruby_add_rdepend ">=dev-ruby/rubygems-tasks-0.2"
ruby_add_rdepend ">=dev-ruby/pry-0.9"
ruby_add_rdepend ">=dev-ruby/pry-debugger-0.2"

