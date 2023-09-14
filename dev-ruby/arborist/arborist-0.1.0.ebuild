# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Arborist is a monitoring toolkit that follows the UNIX philosophy
of small parts and loose coupling for stability, reliability, and
customizability"
HOMEPAGE="http://deveiate.org/projects/arborist"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/schedulability-0.1"
ruby_add_rdepend ">=dev-ruby/loggability-0.12"
ruby_add_rdepend ">=dev-ruby/configurability-3.0"
ruby_add_rdepend ">=dev-ruby/pluggability-0.4"
ruby_add_rdepend ">=dev-ruby/state_machines-0.2"
ruby_add_rdepend ">=dev-ruby/msgpack-0.6"
ruby_add_rdepend ">=dev-ruby/rbczmq-1.7"
ruby_add_rdepend ">=dev-ruby/gli-2.3"
ruby_add_rdepend ">=dev-ruby/highline-1.7"
ruby_add_rdepend ">=dev-ruby/hoe-mercurial-1.4"
ruby_add_rdepend ">=dev-ruby/hoe-deveiate-0.8"
ruby_add_rdepend ">=dev-ruby/hoe-highline-0.2"
ruby_add_rdepend ">=dev-ruby/rspec-3.2"
ruby_add_rdepend ">=dev-ruby/simplecov-0.9"
ruby_add_rdepend ">=dev-ruby/timecop-0.7"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0"
ruby_add_rdepend ">=dev-ruby/hoe-3.15"

