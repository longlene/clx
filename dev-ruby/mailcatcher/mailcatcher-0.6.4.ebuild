# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    MailCatcher runs a super simple SMTP server which catches any
    message sent to it to display in a web interface"
HOMEPAGE="http://mailcatcher.me"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-4.0"
ruby_add_rdepend "=dev-ruby/eventmachine-1.0.9.1"
ruby_add_rdepend ">=dev-ruby/mail-2.3"
ruby_add_rdepend ">=dev-ruby/rack-1.5"
ruby_add_rdepend ">=dev-ruby/sinatra-1.2"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3"
ruby_add_rdepend ">=dev-ruby/thin-1.5.0"
ruby_add_rdepend ">=dev-ruby/skinny-0.2.3"
ruby_add_rdepend ">=dev-ruby/coffee-script-0"
ruby_add_rdepend ">=dev-ruby/compass-0"
ruby_add_rdepend ">=dev-ruby/minitest-5.0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rdoc-0"
ruby_add_rdepend ">=dev-ruby/sass-0"
ruby_add_rdepend ">=dev-ruby/selenium-webdriver-0"
ruby_add_rdepend ">=dev-ruby/sprockets-0"
ruby_add_rdepend ">=dev-ruby/sprockets-sass-0"
ruby_add_rdepend ">=dev-ruby/sprockets-helpers-0"
ruby_add_rdepend ">=dev-ruby/uglifier-0"

