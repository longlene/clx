# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="The project consists of some enhancements to the Ruby "Matrix" module and 
includes: LU and QR (Householder, Givens, Gram Schmidt, Hessenberg) 
decompositions, bidiagonalization, eigenvalue and eigenvector calculations"
HOMEPAGE="http://github.com/SciRuby/extendmatrix"

LICENSE="Apache v2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"

