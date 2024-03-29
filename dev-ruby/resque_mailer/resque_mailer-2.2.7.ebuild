# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Rails plugin for sending asynchronous email with ActionMailer and Resque"
HOMEPAGE="http://github.com/zapnap/resque_mailer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/actionmailer-3.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.6"
ruby_add_rdepend ">=dev-ruby/yard-0.6.0"

