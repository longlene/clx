# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A pure Ruby library to look up timezone from latitude / longitude offline"
HOMEPAGE="https://github.com/gunyarakun/timezone_finder"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.11"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/minitest-5.0"
ruby_add_rdepend ">=dev-ruby/simplecov-0.11"
ruby_add_rdepend ">=dev-ruby/rubocop-0.40"

