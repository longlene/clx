# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://github.com/twbs/bootstrap-sass"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sass-3.3.4"
ruby_add_rdepend ">=dev-ruby/autoprefixer-rails-5.2.1"
ruby_add_rdepend ">=dev-ruby/minitest-5.8"
ruby_add_rdepend ">=dev-ruby/minitest-reporters-1.1"
ruby_add_rdepend ">=dev-ruby/capybara-2.5.0"
ruby_add_rdepend ">=dev-ruby/poltergeist-0"
ruby_add_rdepend ">=dev-ruby/actionpack-4.1.5"
ruby_add_rdepend ">=dev-ruby/activesupport-4.1.5"
ruby_add_rdepend ">=dev-ruby/json-1.8.1"
ruby_add_rdepend ">=dev-ruby/sprockets-rails-2.1.3"
ruby_add_rdepend ">=dev-ruby/jquery-rails-3.1.0"
ruby_add_rdepend ">=dev-ruby/slim-rails-0"
ruby_add_rdepend ">=dev-ruby/uglifier-0"
ruby_add_rdepend ">=dev-ruby/term-ansicolor-0"

