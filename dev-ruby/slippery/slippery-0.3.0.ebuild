# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Make presentations with Markdown"
HOMEPAGE="https://github.com/plexus/slippery"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/hexp-0.3.3"
ruby_add_rdepend ">=dev-ruby/kramdown-1.1"
ruby_add_rdepend ">=dev-ruby/rake-10.1"
ruby_add_rdepend ">=dev-ruby/listen-2.7"
ruby_add_rdepend ">=dev-ruby/concord-0.1.4"
ruby_add_rdepend ">=dev-ruby/asset_packer-0.1.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.14"
ruby_add_rdepend ">=dev-ruby/mutant-rspec-0.5.3"

