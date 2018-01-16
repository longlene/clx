# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby wrapper around the HyPDF API"
HOMEPAGE="https://bitbucket.org/quantumgears/hypdf_gem"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/httparty-0.13"
ruby_add_rdepend ">=dev-ruby/httmultiparty-0.3"
ruby_add_rdepend ">=dev-ruby/rspec-0"

