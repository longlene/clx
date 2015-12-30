# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    GirFFI creates bindings for GObject-based libraries at runtime based on introspection
    data provided by the GObject Introspection Repository (GIR) system"
HOMEPAGE="http://www.github.com/mvz/ruby-gir-ffi"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-1.8"
ruby_add_rdepend ">=dev-ruby/indentation-0.1.1"
ruby_add_rdepend ">=dev-ruby/minitest-5.2"
ruby_add_rdepend ">=dev-ruby/rr-1.1.2"
ruby_add_rdepend ">=dev-ruby/rake-10.1"

