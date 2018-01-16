# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Slide Show (S9) - A Free Web Alternative to PowerPoint and Keynote in Ruby"
HOMEPAGE="https://github.com/slideshow-s9/slideshow"

LICENSE="Public Domain"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/slideshow-models-2.4.0"
ruby_add_rdepend ">=dev-ruby/slideshow-templates-2.4.0"
ruby_add_rdepend ">=dev-ruby/gli-2.5.6"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0"
ruby_add_rdepend ">=dev-ruby/hoe-3.13"

