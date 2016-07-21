# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Thin library to create web applications"
HOMEPAGE="https://github.com/frodsan/tynn"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-1.6"
ruby_add_rdepend ">=dev-ruby/syro-1.1"
ruby_add_rdepend ">=dev-ruby/cutest-1.2"
ruby_add_rdepend ">=dev-ruby/erubis-2.7"
ruby_add_rdepend ">=dev-ruby/hmote-1.4"
ruby_add_rdepend ">=dev-ruby/tilt-2.0"

