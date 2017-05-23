# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A ruby wrapper to the HDF5 data library"
HOMEPAGE="http://github.com/edmundhighcock/hdf5"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-0"
ruby_add_rdepend ">=dev-ruby/narray-0"
ruby_add_rdepend "=dev-ruby/shoulda-3.0.1"
ruby_add_rdepend ">=dev-ruby/rdoc-3.12"
ruby_add_rdepend ">dev-ruby/bundler-1.0.0"
ruby_add_rdepend ">=dev-ruby/jeweler-2.0.1"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/minitest-4"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0"

