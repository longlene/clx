# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="PlainSite is a simple but powerful static site generator inspired by Jekyll and Octopress"
HOMEPAGE="https://github.com/JexCheng/plain_site"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/pygments_rb-0.6.0"
ruby_add_rdepend ">=dev-ruby/kramdown-1.5.0"
ruby_add_rdepend ">=dev-ruby/safe_yaml-0.9.4"
ruby_add_rdepend ">=dev-ruby/grit-2.5.0"
ruby_add_rdepend ">=dev-ruby/rake-10.0.3"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0.0"
ruby_add_rdepend ">=dev-ruby/commander-4.1.3"
ruby_add_rdepend ">=dev-ruby/listen-1.2.3"

