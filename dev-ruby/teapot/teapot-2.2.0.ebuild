# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="	Teapot is a tool for managing complex cross-platform builds"
HOMEPAGE="http://www.teapot.nz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rainbow-2.0"
ruby_add_rdepend ">=dev-ruby/graphviz-0.4"
ruby_add_rdepend ">=dev-ruby/rugged-0"
ruby_add_rdepend ">=dev-ruby/build-1.1"
ruby_add_rdepend ">=dev-ruby/build-files-1.3"
ruby_add_rdepend ">=dev-ruby/build-dependency-1.1"
ruby_add_rdepend ">=dev-ruby/build-uri-1.0"
ruby_add_rdepend ">=dev-ruby/build-text-1.0"
ruby_add_rdepend ">=dev-ruby/samovar-1.7"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rspec-3.6"
ruby_add_rdepend ">=dev-ruby/rake-0"

