# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Syntactical sugar around an EM::Deferrable
"
HOMEPAGE="https://github.com/motionbox/deferred"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/eventmachine-0.12.10"
ruby_add_rdepend ">=dev-ruby/rspec-2.5.0"
ruby_add_rdepend ">=dev-ruby/ZenTest-4.5.0"
ruby_add_rdepend ">=dev-ruby/evented-spec-0.4.1"

