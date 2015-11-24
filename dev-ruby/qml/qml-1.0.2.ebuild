# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="ruby-qml provides bindings between QML and Ruby and enables you to use Qt Quick-based GUI from Ruby"
HOMEPAGE="http://seanchas116.github.io/ruby-qml/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.5"
ruby_add_rdepend ">=dev-ruby/rake-10.3"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/celluloid-0"
ruby_add_rdepend ">=dev-ruby/twitter-5.11"
ruby_add_rdepend ">=dev-ruby/sequel-4.12"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3"

#all_ruby_prepare() {
#	sed -i -e '/git ls-files/ s:^:#:' ${RUBY_FAKEGEM_GEMSPEC}
#}
