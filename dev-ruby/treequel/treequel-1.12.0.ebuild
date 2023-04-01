# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Treequel is an LDAP toolkit for Ruby"
HOMEPAGE="http://deveiate.org/projects/Treequel"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ruby-ldap-0.9"
ruby_add_rdepend ">=dev-ruby/loggability-0.4"
ruby_add_rdepend ">=dev-ruby/hoe-mercurial-1.4"
ruby_add_rdepend ">=dev-ruby/hoe-deveiate-0.9"
ruby_add_rdepend ">=dev-ruby/hoe-highline-0.2"
ruby_add_rdepend ">=dev-ruby/rspec-2.8"
ruby_add_rdepend ">=dev-ruby/sequel-3.38"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0"
ruby_add_rdepend ">=dev-ruby/hoe-3.16"

