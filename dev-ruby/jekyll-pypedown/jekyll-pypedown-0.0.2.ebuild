# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Jekyll plugin that enables Pygments syntax highlighting for kramdown-parsed fenced code blocks"
HOMEPAGE="https://github.com/paulrobertlloyd/jekyll-pypedown"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jekyll-2.4"
ruby_add_rdepend ">=dev-ruby/pygments_rb-0.6"
ruby_add_rdepend ">=dev-ruby/typogruby-1.0"
ruby_add_rdepend ">=dev-ruby/kramdown-1.4"

