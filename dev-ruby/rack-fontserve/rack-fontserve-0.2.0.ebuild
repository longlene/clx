# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Sinatra app for serving web fonts easily with proper caching and access-control headers"
HOMEPAGE="https://github.com/colszowka/rack-fontserve"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-1.2.6"
ruby_add_rdepend ">=dev-ruby/rack-test-0.5.7"
ruby_add_rdepend ">=dev-ruby/shoulda-2.11.3"
ruby_add_rdepend ">=dev-ruby/simplecov-0.4.0"
ruby_add_rdepend ">=dev-ruby/rake-0"

