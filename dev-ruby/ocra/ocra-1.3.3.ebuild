# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="OCRA (One-Click Ruby Application) builds Windows executables from Ruby
source code"
HOMEPAGE="http://ocra.rubyforge.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/minitest-5.3"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0"
ruby_add_rdepend ">=dev-ruby/hoe-3.12"

