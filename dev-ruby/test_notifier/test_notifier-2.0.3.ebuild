# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Display system notifications (dbus, growl and snarl) after
running tests"
HOMEPAGE="http://rubygems.org/gems/test_notifier"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/notifier-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0.0"
ruby_add_rdepend ">=dev-ruby/rake-0"

