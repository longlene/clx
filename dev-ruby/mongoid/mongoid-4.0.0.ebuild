# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=""

inherit ruby-fakegem

DESCRIPTION="Mongoid is an ODM (Object Document Mapper) Framework for MongoDB, written in Ruby"
HOMEPAGE="http://mongoid.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activemodel-4.0"
ruby_add_rdepend ">=dev-ruby/tzinfo-0.3.37"
ruby_add_rdepend ">=dev-ruby/moped-2.0.0"
#ruby_add_rdepend ">=dev-ruby/origin-2.1"
ruby_add_rdepend ">=dev-ruby/origin-1.1.0"

