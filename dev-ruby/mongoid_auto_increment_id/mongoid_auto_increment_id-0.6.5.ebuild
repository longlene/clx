# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This gem for change Mongoid id field as Integer like MySQL"
HOMEPAGE="https://github.com/huacnlee/mongoid_auto_increment_id"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/mongoid-3.1.0"

