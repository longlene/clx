# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Install gsl, statistics2 and provides a C extension to optimize the following methods

* Vector#frecuencies
* Vector#set_valid_data
* Vector#check_type
* Dataset#case_as_hash
* Dataset#case_as_array
* Bivariate::Tetrachoric"
HOMEPAGE="http://rubyforge.org/projects/ruby-statsample/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/statsample-1.2"
ruby_add_rdepend ">=dev-ruby/statistics2-0.54"
ruby_add_rdepend ">=dev-ruby/gsl-1.14"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0"
ruby_add_rdepend ">=dev-ruby/rdoc-3.10"
ruby_add_rdepend ">=dev-ruby/hoe-2.12"

