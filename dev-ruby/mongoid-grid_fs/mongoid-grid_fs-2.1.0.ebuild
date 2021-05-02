# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A pure Mongoid/Moped implementation of the MongoDB GridFS specification"
HOMEPAGE="https://github.com/ahoward/mongoid-grid_fs"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/mongoid-3.0"
ruby_add_rdepend ">=dev-ruby/mime-types-1.0"

