# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A wrapper around strace(1) that allows you to perform targetted tracing of a
block"
HOMEPAGE="http://seattlerb.rubyforge.org/strace_me"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/open4-0.9"
ruby_add_rdepend ">=dev-ruby/rubyforge-2.0.3"
ruby_add_rdepend ">=dev-ruby/gemcutter-0.5.0"
ruby_add_rdepend ">=dev-ruby/minitest-1.5.0"
ruby_add_rdepend ">=dev-ruby/hoe-2.5.0"

