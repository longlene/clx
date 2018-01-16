# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Captcha-Plugin for Rails"
HOMEPAGE="http://github.com/phatworx/easy_captcha"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.1.0"
ruby_add_rdepend ">=dev-ruby/rails-3.0.0"
ruby_add_rdepend ">=dev-ruby/rmagick-2.13.1"
ruby_add_rdepend ">=dev-ruby/rspec-rails-2.8.1"
ruby_add_rdepend ">=dev-ruby/simplecov-0.3.8"
ruby_add_rdepend ">=dev-ruby/yard-0.7.0"

