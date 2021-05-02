# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Report Adhearsion application exceptions and deployments to:

Airbrake
Errbit
This Adhearsion plugin requires Adhearsion 2"
HOMEPAGE="http://github.com/adhearsion/adhearsion-reporter"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/adhearsion-2.0"
ruby_add_rdepend ">=dev-ruby/toadhopper-1.3.0"
ruby_add_rdepend ">=dev-ruby/newrelic_rpm-3.6"
ruby_add_rdepend ">=dev-ruby/guard-rspec-0"

