# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="
    This small class will store (and if requested, also output) Environment
    information, such as the GCC Version in use, the Kernel, which Ruby Version
    is used, what the Host CPU Model is (on Linux), GTK and GLIB version,
    and so forth"
HOMEPAGE="http://rubygems.org/gems/environment_information"

LICENSE="GPL 2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/colours-0"
ruby_add_rdepend ">=dev-ruby/save_file-0"

