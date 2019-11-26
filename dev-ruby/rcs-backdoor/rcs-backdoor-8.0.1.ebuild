# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Simulate a backdoor in ruby"
HOMEPAGE=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/test-unit-0"
ruby_add_rdepend ">=dev-ruby/colorize-0"
ruby_add_rdepend ">=dev-ruby/mail-0"
ruby_add_rdepend ">=dev-ruby/log4r-1.1.9"
ruby_add_rdepend ">=dev-ruby/rcs-common-0"
ruby_add_rdepend ">=dev-ruby/bdb-0"
ruby_add_rdepend ">=dev-ruby/sbdb-0"

