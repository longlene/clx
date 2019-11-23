# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.rdoc"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides a single point of entry for using basic features of ruby ORMs"
HOMEPAGE="http://github.com/ianwhite/orm_adapter"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.0.0"
ruby_add_rdepend ">=dev-ruby/git-1.2.5"
ruby_add_rdepend ">=dev-ruby/yard-0.6.0"
ruby_add_rdepend ">=dev-ruby/rake-0.8.7"
ruby_add_rdepend ">=dev-ruby/activerecord-3.2.15"
ruby_add_rdepend ">=dev-ruby/mongoid-2.8.0"
ruby_add_rdepend ">=dev-ruby/mongo_mapper-0.11.0"
#ruby_add_rdepend ">=dev-ruby/bson_ext-1.3.0"
ruby_add_rdepend ">=dev-ruby/bson-1.3.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.4.0"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3.2"
ruby_add_rdepend ">=dev-ruby/datamapper-1.0"
ruby_add_rdepend ">=dev-ruby/dm-sqlite-adapter-1.0"
ruby_add_rdepend ">=dev-ruby/dm-active_model-1.0"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec || die "sed failed"
}
