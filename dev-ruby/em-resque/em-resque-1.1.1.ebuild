# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    Em-resque is a version of Resque, which offers non-blocking and non-forking
    workers"
HOMEPAGE="http://github.com/SponsorPay/em-resque"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/resque-1.2"
ruby_add_rdepend ">=dev-ruby/em-synchrony-1.0.0"
ruby_add_rdepend ">=dev-ruby/em-hiredis-0.1.0"

