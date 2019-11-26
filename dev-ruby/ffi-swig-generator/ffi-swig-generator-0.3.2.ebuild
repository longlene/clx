# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="ffi-swig-generator is a ruby-ffi wrapper code generator that produces
ruby-ffi glue code parsing C header files through SWIG"
HOMEPAGE="http://kenai.com/projects/ruby-ffi/sources/swig-generator/show"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0.8.7"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.3.1"

