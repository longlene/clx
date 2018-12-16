# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Born as working code I needed to import in a larger framework,
this little gem constitutes a basic but de facto very usable
neuroevolution framework"
HOMEPAGE="https://github.com/giuse/neuroevo"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.12"
ruby_add_rdepend ">=dev-ruby/rake-11.1"
ruby_add_rdepend ">=dev-ruby/rspec-3.4"
ruby_add_rdepend ">=dev-ruby/ae-1.8"
ruby_add_rdepend ">=dev-ruby/pry-0.10"
ruby_add_rdepend ">=dev-ruby/pry-nav-0.2"
ruby_add_rdepend ">=dev-ruby/pry-rescue-1.4"
ruby_add_rdepend ">=dev-ruby/pry-stack_explorer-0.4"
ruby_add_rdepend ">=dev-ruby/descriptive_statistics-2.5"
ruby_add_rdepend ">=dev-ruby/nmatrix-0.2"
ruby_add_rdepend ">=dev-ruby/nmatrix-atlas-0.2"

